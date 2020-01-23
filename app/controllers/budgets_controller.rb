class BudgetsController < ApplicationController
  include FeatureFlags
  include BudgetsHelper
  feature_flag :budgets

  before_action :load_budget, only: :show
  load_and_authorize_resource
  before_action :set_default_budget_filter, only: :show
  before_action :get_active_geographies, only: :index
  has_filters %w[not_unfeasible feasible unfeasible unselected selected winners], only: :show

  respond_to :html, :js

  def show
    raise ActionController::RoutingError, "Not Found" unless budget_published?(@budget)
  end

  def index
    @finished_budgets = @budgets.finished.order(created_at: :desc)
    @budgets_coordinates = current_budget_map_locations
    @banners = Banner.in_section("budgets").with_active
    @geographies_data = Geography.all.map{ |g| {
                          outline_points: g.parsed_outline_points,
                          color: g.color,
                          heading_id: (@active_geographies.key?(g.id) ?
                                       @active_geographies[g.id] : nil ) 
                          }
                        }
  end

  private

    def load_budget
      @budget = Budget.find_by_slug_or_id! params[:id]
    end

    def get_active_geographies
      @active_geographies = Geography.geographies_with_active_headings
    end
end
