require "rails_admin_import/import_logger"

module RailsAdminImport
  class Importer
    private

    def find_or_create_object(record, update)
      field_names = import_model.model_fields.map(&:name)
      new_attrs = record.select do |field_name, value|
        field_names.include?(field_name) && !value.blank?
      end

      model = import_model.model
      object = if update.present?
                 model.where(update => record[update]).first
               end

      if object.nil?
        object = model.new(new_attrs)
        object.owner_id = params[:owner_id]
      else
        object.attributes = new_attrs.except(update.to_sym)
      end
      object
    end
  end
end
