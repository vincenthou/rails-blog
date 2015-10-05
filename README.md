# rails-blog
This is a testing project for inspect rails source

# General steps

## Use rails to generate model

```sh
rails g model Entity field:type ... field:type
```

## Create table in database

It is based on the migration files in `db/migrate` folder 

```sh
rake db:migrate
```

## Declare relationships between models if needed

```ruby
class Article < ActiveRecord::Base
  has_many :comments, dependent: :destory
end

class Comment < ActiveRecord::Base
  belong_to :article
end
```

[More info](http://guides.rubyonrails.org/association_basics.html)

## Add routes

Add common routes using resource sytax, More [routes reference](http://guides.rubyonrails.org/routing.html)

```ruby
Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :articles
end
```

Show all the routes with rake command

```sh
rake routes
```

## Use rails to generate controller

**Pay attention to the plurality**

```sh
rails g controller Entitys
```

## Add view templates in with proper path and name

Below is a sample shared form template for creating and editing entity.

```ruby
<%= form_for @entity do |f| %>

  <% if @entity.errors.any? %>
    <div id="error_explanation">
      <h2>
        <%= pluralize(@entity.errors.count, "error") %> prohibited
        this entity from being saved:
      </h2>
      <ul>
        <% @entity.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <p>
    <%= f.label :title %><br>
    <%= f.text_field :title %>
  </p>

  <p>
    <%= f.label :text %><br>
    <%= f.text_area :text %>
  </p>

  <p>
    <%= f.submit %>
  </p>
<% end %>
```

## Add handler in controller file

CRUD method should be defined in related controller class ( `new`, create, show, `edit`, update, destroy, index methods )

## Add basic authentification for requests

Use http_basic_authenticate_with method to support basic auth, [more info](http://guides.rubyonrails.org/security.html)

```ruby
class ArticlesController < ApplicationController

http_basic_authenticate_with name: "vincent", password: "secret", except: [:index, :show]

...

end
```
