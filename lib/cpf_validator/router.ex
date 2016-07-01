defmodule CpfValidator.Router do

  use Plug.Router

  plug Plug.Parsers, parsers: [:urlencoded]

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, EEx.eval_file("templates/index.eex", []))
  end

  get "/validator" do
    import CpfValidator.Validator

    {:ok, body, conn} = read_body(conn)
    data = Poison.decode!(body)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{valid: validate(data["cpf"])}))
  end

end
