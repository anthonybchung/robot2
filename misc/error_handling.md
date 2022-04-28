# Rescue

```
begin
    code that could err.
rescue
    puts "you have an error"
end

```

# Retry, else and ensure

```
begin
    code that could err.
rescue StandardError => e
    error stuff
    retry
end
```