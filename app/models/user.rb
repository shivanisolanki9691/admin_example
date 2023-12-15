class User < ApplicationRecord
	ActiveAdmin.register User do
	  # Create sections on the index screen
	  scope :all, default: true
	  scope :available
	  scope :drafts

	  # Filterable attributes on the index screen
	  filter :title
	  filter :author, as: :select, collection: ->{ User.authors }
	  filter :price
	  filter :created_at

	  # Customize columns displayed on the index screen in the table
	  index do
	    column :title
	    column "Price", sortable: :price do |user|
	      number_to_currency user.price
	    end
	    actions
	  end
	end
end
