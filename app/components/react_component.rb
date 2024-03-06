# frozen_string_literal: true

class ReactComponent < ViewComponent::Base
  attr_reader :component, :raw_props

  # mount.tsにコンポーネントを追加しておく必要があります．
  def initialize(component:, raw_props: {})
    @component = component
    @raw_props = raw_props
  end

  private

  def react_component
    @component.camelize
  end

  def props
    camelize_keys(raw_props).to_json
  end

  # TS用にキャメルケースに変換
  def camelize_keys(data)
    case data
    when Hash
      data.each_with_object({}) do |(key, value), new_data|
        new_key = key.to_s.camelize(:lower)
        new_value = camelize_keys(value)
        new_data[new_key] = new_value
      end
    when Array
      data.map { |d| camelize_keys(d) }
    else
      if defined?(ActionController::Parameters) && data.is_a?(ActionController::Parameters)
        camelize_keys(data.to_h)
      else
        data
      end
    end
  end
end
