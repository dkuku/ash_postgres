defmodule AshPostgres.Template do
  @moduledoc """
  Implements callback functions that get injected into mix ash.gen.resource generated files
  """
  @behaviour Ash.Template

  @impl true
  def resource_template(assigns) when is_map(assigns) do
    """
    postgres do
      repo #{Map.get(assigns, :project_name, "project_name")}.Repo
      table "#{Map.get(assigns, :table_name, "table_name")}"
    end
    """
  end

  @impl true
  def guide_template(assigns) when is_map(assigns) do
    """
    # nothing in here - just for test
    # postgres do
    #   repo #{Map.get(assigns, :project_name, "project_name")}.Repo
    #   table "#{Map.get(assigns, :table_name, "table_name")}"
    # end
    """
  end

  @impl true
  def shell_template(assigns) when is_map(assigns) do
    """
    Make sure you ran migrations

    mix ash_postgres.generate_migrations
    """
  end
end
