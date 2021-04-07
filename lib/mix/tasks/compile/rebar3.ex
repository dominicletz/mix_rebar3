defmodule Mix.Tasks.Compile.Rebar3 do
  use Mix.Task.Compiler

  @impl Mix.Task.Compiler
  def run(_args) do
    project = Mix.Project.config()
    lib_path = Path.join(Mix.Project.build_path(project), "lib/*/ebin")
    out_path = Mix.Project.app_path(project)

    rebar = Mix.Rebar.rebar_cmd(:rebar3)
    cmd = "#{rebar} bare compile -o #{out_path} --paths #{lib_path}"

    IO.puts("Running: #{cmd}")

    case Mix.shell().cmd(cmd, print_app: true) do
      0 ->
        {:ok, []}

      _other ->
        IO.puts("rebar3 failed! If it does not show errors try again with `DEBUG=1 mix compile`")
        {:error, []}
    end
  end
end
