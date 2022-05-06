task :env do
  on roles(:all) do
    execute "env"
    execute "echo $HELLO"
  end
end