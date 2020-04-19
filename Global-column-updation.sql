--below function postgres 11
create or replace procedure d_c()
as $$
DECLARE
a VARCHAR(100);
b VARCHAR(100);
c VARCHAR(100);
t record;
begin
	a:='alter table ';
	b:=' alter column ';
	c:=' SET DEFAULT current_timestamp'; 
    for t IN select column_name, table_name
            from information_schema.columns
            where column_name='<condition>'
    loop
        execute concat(a,t.table_name ,b,t.column_name ,c);
    end loop;
end$$ LANGUAGE plpgsql;
--below function postgres 11
create or replace function d_c() returns boolean
as $$
DECLARE
a VARCHAR(100);
b VARCHAR(100);
c VARCHAR(100);
t record;
begin
	a:='alter table ';
	b:=' alter column ';
	c:=' SET DEFAULT current_timestamp'; 
	    for t IN select column_name, table_name
		    from information_schema.columns
		    where column_name='<condition>'
    loop
        execute concat(a,t.table_name ,b,t.column_name ,c);
    end loop;
    return true;
end$$ LANGUAGE plpgsql;
