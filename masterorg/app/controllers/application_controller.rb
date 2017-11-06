class ApplicationController < ActionController::Base
  	
  	cprotect_from_forgery with: :exception
           

	before_action :subdomain_change_database

	def subdomain_change_database
	  if request.subdomain.present? && request.subdomain != "www"
	    # 'SOME_PREFIX_' + is optional, but would make DBs easier to delineate
	      ActiveRecord::Base.establish_connection(website_connection( request.subdomain ))
	   else
	   	ActiveRecord::Base.establish_connection(website_connection( "development" ))
	  end
	end

	# Return regular connection hash but with database name changed
	# The database name is a attribute (column in the database)
	def website_connection(subdomain)
	  default_connection.dup.update(:database => ("db/" + subdomain + ".sqlite3"))
	end

	# Regular database.yml configuration hash
	def default_connection
	  @default_config ||= ActiveRecord::Base.connection.instance_variable_get("@config").dup
	end

end
