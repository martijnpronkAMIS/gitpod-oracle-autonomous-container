create user app_test identified by Welkom01x123 account unlock;
grant soda_app,connect, resource to app_test;
alter user app_test quota unlimited on data;

begin
ords.enable_schema(p_schema => 'APP_TEST');
end;
/

-- mongodb://app_test:Welkom01x123@localhost:27017/app_test?authMechanism=PLAIN&authSource=$external&ssl=true&retryWrites=false&loadBalanced=true