create user apptest identified by Welkom01x123 account unlock;
grant soda_app,connect, resource to apptest;
alter user apptest quota unlimited on data;

begin
ords.enable_schema(p_schema => 'APPTEST');
end;
/

exit

-- mongodb://apptest:Welkom01x123@localhost:27017/apptest?authMechanism=PLAIN&authSource=$external&ssl=true&retryWrites=false&loadBalanced=true&tlsInsecure=true