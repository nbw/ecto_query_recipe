defmodule MyApp.Query do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      import Keyword, only: [get: 2, get: 3]
      import Ecto.Query, warn: false

      def query(resource, opts) do
        where_clause = get(opts, :where, [])
        order_by = get(opts, :order_by)
        preload = get(opts, :preload)
        group_by = get(opts, :group_by)
        limit = get(opts, :limit)
        select = get(opts, :select)

        resource
        |> do_where(where_clause)
        |> maybe_preload(preload)
        |> maybe_order_by(order_by)
        |> maybe_group_by(group_by)
        |> maybe_limit(limit)
        |> maybe_select(select)
      end

      defp do_where(query, where_clause) do
        Enum.reduce(where_clause, query, fn w, q ->
          case w do
            {k, v} when is_list(v) ->
              m = Macro.to_string(quote do: x.unquote(k) in ^v)
              {result, _binding} = Code.eval_string("where(q, [x], #{m})", [q: q, v: v], __ENV__)

              result

            _ ->
              where(q, ^[w])
          end
        end)

        # where(query, ^where_clause)
      end

      defp maybe_order_by(q, nil), do: q
      defp maybe_order_by(q, o), do: order_by(q, ^o)

      defp maybe_preload(q, nil), do: q
      defp maybe_preload(q, p), do: preload(q, ^p)

      defp maybe_group_by(q, nil), do: q
      defp maybe_group_by(q, p), do: group_by(q, ^p)

      defp maybe_limit(q, nil), do: q
      defp maybe_limit(q, p), do: limit(q, ^p)

      defp maybe_select(q, nil), do: q
      defp maybe_select(q, p), do: select(q, ^p)
    end
  end
end
