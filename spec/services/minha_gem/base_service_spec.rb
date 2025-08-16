require "rails_helper"

RSpec.describe MinhaGem::BaseService do
  let(:dummy_service_class) do
    Class.new(described_class) do
      def initialize(value:, raise_error: false)
        @value = value
        @raise_error = raise_error
      end

      def call
        return failure(:disabled) unless enabled?
        return failure(:boom) if @raise_error
        success(data: @value * 2)
      end
    end
  end

  around do |example|
    original = MinhaGem.config.enabled
    example.run
    MinhaGem.config.enabled = original
  end

  it "expõe config via helpers" do
    expect(dummy_service_class.new(value: 1).send(:config)).to eq(MinhaGem.config)
  end

  it "retorna sucesso quando habilitado" do
    MinhaGem.config.enabled = true
    result = dummy_service_class.call(value: 3)
    expect(result).to be_success
    expect(result.data).to eq(6)
    expect(result.error).to be_nil
  end

  it "retorna falha quando desabilitado" do
    MinhaGem.config.enabled = false
    result = dummy_service_class.call(value: 3)
    expect(result).to be_failure
    expect(result.error).to eq(:disabled)
  end

  it "retorna falha customizada" do
    MinhaGem.config.enabled = true
    result = dummy_service_class.call(value: 3, raise_error: true)
    expect(result).to be_failure
    expect(result.error).to eq(:boom)
  end
end
