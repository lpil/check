Notes
=====

```elixir
check "that it works", given: [x: integer, y: integer] do
  assert is_integer x
end


@given x: integer,
       y: integer
check "that it works" do
  assert is_integer x
end
```
