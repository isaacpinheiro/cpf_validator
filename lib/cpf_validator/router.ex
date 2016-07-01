defmodule CpfValidator.Router do

  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, EEx.eval_file("templates/index.eex", []))
  end

  get "/validator" do
    send_resp(conn, 200, "TODO")
    # TODO
  end

end
