defmodule Mix.Tasks.Compile.Rebar3 do
  use Mix.Task.Compiler

  @impl Mix.Task.Compiler
  def run(_args) do
    project = Mix.Project.config()
    lib_path = Path.join(Mix.Project.build_path(project), "lib/*/ebin")
    out_path = Mix.Project.app_path(project)
    app_name = project[:app]
    app_file = Path.join([out_path, "ebin", "#{app_name}.app"])
    pre_existing = File.exists?(app_file)

    {rebar, args} =
      Mix.Rebar.rebar_args(:rebar3, ["bare", "compile", "-o", out_path, "--paths", lib_path])

    IO.puts("Running: #{rebar} #{Enum.join(args, " ")}")

    case Mix.shell().cmd({rebar, args}, print_app: true) do
      0 ->
        if not pre_existing and File.exists?(app_file) do
          File.rm(app_file)
          IO.puts("Removed rebar3 generated app file #{app_file}")
        end

        :ok

      _other ->
        IO.puts("rebar3 failed! If it does not show errors try again with `DEBUG=1 mix compile`")

        {:error,
         ["rebar3 failed! If it does not show errors try again with `DEBUG=1 mix compile`"]}
    end
  end

  @impl true
  def clean() do
    {rebar, args} = Mix.Rebar.rebar_args(:rebar3, ["clean"])
    IO.puts("Running: #{rebar} #{Enum.join(args, " ")}")

    case Mix.shell().cmd({rebar, args}, print_app: true) do
      0 ->
        :ok

      _other ->
        {:error, ["rebar3 failed! If it does not show errors try again with `DEBUG=1 mix clean`"]}
    end
  end
end
