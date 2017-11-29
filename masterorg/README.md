Web Applications Using Subdomains to Designate Tenants ie subdomain point out to the respective database.


For a quick review
there are two databases
1. development.sqlite DEFAULT
2. subdomain1.sqlite

 the http request cases:
 1. www.domain.com =>  db doesn't change it will use development.sqlite 
 2. subdomain1.domain.com  =>  db does  change to subdomain1.sqlite 
 3. inpropriatesubdomain.domain.com =>  db doesn't change it will use development.sqlite 
 
 
 
 checkout for code in application_controller.rb
 
 long live RAILS
