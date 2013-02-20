in_place_model
==============

Given an ActiveRecord model provides a inplace editing table for all fields

Usage:
======

  # Example:
  #
  #   # Controller
  #   class BlogController < ApplicationController
  #     in_place_model_for :post
  #   end
  #
  #   # View
  #   <%= in_place_model :post , 1 , :exclude => [:created_at] %>
  #   <%= in_place_model_all :post  , :exclude => [:created_at] %>
  #
