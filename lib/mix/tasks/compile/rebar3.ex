defmodule Mix.Tasks.Compile.Rebar3 do
  use Mix.Task.Compiler

  @impl Mix.Task.Compiler
  def run(_args) do
    project = Mix.Project.config()
    lib_path = Path.join(Mix.Project.build_path(project), "lib/*/ebin")
    out_path = Mix.Project.app_path(project)

    rebar = Mix.Rebar.rebar_cmd(:rebar3)
    cmd = "#{rebar} bare compile -o #{out_path} --paths #{lib_path}"

    if Mix.shell().cmd(cmd, print_app: true) == 0 do
      {:ok, []}
    else
      {:error, []}
    end
  end
end
