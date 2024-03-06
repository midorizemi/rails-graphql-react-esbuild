module Sources
  class ActiveRecordObject < GraphQL::Dataloader::Source
    def initialize(model_class, association_name)
      @model_class = model_class
      @association_name = association_name
    end

    def fetch(ids)
      records = @model_class.where(id: ids).preload(@association_name)
      # return a list with `nil` for any ID that wasn't found
      ids.map { |id| records.find { _1.id == id.to_i }&.public_send(@association_name) }
    end
  end
end
