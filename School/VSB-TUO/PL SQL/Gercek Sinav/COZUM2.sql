/*
-- *********************** 1 ***********************

alter table Product add Price integer;
update Product set Price = 1000;

set serveroutput on;
create or replace procedure PriceFix(p_count out integer)
as
  CURSOR c is select nid, pid, purchasecount, price from Purchase;
  v_price product.price%type;
begin
  for temp in c loop
    select price into v_price from product where pid = temp.pid;
    if v_price * temp.purchasecount != temp.price then
      update purchase set price = v_price * temp.purchasecount where nid = temp.nid;
      p_count := p_count + 1;
    end if;
  end loop;  
  dbms_output.put_line(p_count);
end;

set serveroutput on;
Declare 
  temp integer;
begin 
  temp := 0;
  PriceFix(temp);
end;

-- *********************** 1 ***********************


-- *********************** 2 ***********************

create or replace procedure InsertComplaint
(
  p_nID Complaint.nid%type,
  p_duration Complaint.duration%type,
  p_price Complaint.price%type
)
as
  v_count int;
begin
  select count(*) into v_count from Purchase nID = p_nID;
  if(v_count = 1) then
    select count(*) into v_count from Complaint where nID = p_nID;
    if (v_count = 3) then
      delete from Complaint where nID = p_nID;
      delete from Purchase where nID = p_nID;
    else
      insert into Complaint values (p_nID, v_count + 1, p_duration, p_price);
      dbms_output.put_line('Complaint has been saved.');
    end if;
  else
    dbms_output.put_line('The purchase with the nID = ' || p_nID || 'does not exist.');
  end if;
  commit;
  exception
    when others then
      rollback;
end;

-- *********************** 2 ***********************
*/











