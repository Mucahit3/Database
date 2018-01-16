/*
-- ******************** 1 ********************

create or replace procedure AddComplaint
(
  p_nID Complaint.nid%type, 
  p_complaintorder Complaint.complaintorder%type,
  p_duration Complaint.duration%type, 
  p_price Complaint.price%type 
)
as
  v_count int;
  v_price_r int;
  v_price_n int;
  v_pID Purchase.pID%type;
begin
  select count(*) into v_count from Purchase where nID=p_nID;
  if (v_count = 1) then
    select sum(price) into v_price_r from Complaint where nID=p_nID;
    select price into v_price_n from Purchase where nID=p_nID;
    if (v_price_r + p_price > v_price_n) then
      select pID into v_pID from Purchase where nID = p_nID;
      update Product set lastProductionYear = EXTRACT(YEAR from SYSDATE) where pID=v_pID;
      dbms_output.put_line('Product with the serial number '|| v_pID ||' has been taken out of production.');
  else
    insert into Complaint values (p_nID, p_complaintorder, p_duration, p_price);
    dbms_output.put_line('Complaint has been saved.');
  end if;
  else
    dbms_output.put_line('The purchase with the nID = ' || p_nID || ' does not exist.');
  end if;
  commit;
  exception
  when others then
    rollback;
end;

set serveroutput on;
execute AddComplaint(10, 3, 100, 2800);
select * from Complaint where nID = 10;
select * from Product;

-- ******************** 1 ********************




-- ******************** 2 ********************

create or replace procedure CustomerReport(p_order varchar2)
as
  cursor c_name is select name from Customer order by name;
  cursor c_purchase is select Customer.cID, name, count(nID) from Customer, Purchase 
  where Customer.cID = Purchase.cID group by Customer.cID, name order by count(nID) desc;
  cursor c_complaint is select Customer.cID, name, count(Complaint.nID) from Customer, Purchase, Complaint 
  where Customer.cID = Purchase.cID group by Customer.cID, name order by count(Complaint.nID) desc;
begin
  if(p_order = 'name') then
    dbms_output.put_line('List of the customers ordered by their names:');
    for row in c_name loop
      dbms_output.put_line(row.name);
    end loop;
  elsif(p_order = 'purchase') then
    dbms_output.put_line('List of the customers ordered by their purchases:');
    for row in c_purchase loop
      dbms_output.put_line(row.name);
    end loop;
  elsif(p_order = 'complaint') then
    dbms_output.put_line('List of the customers ordered by their complaints:');
    for row in c_complaint loop
      dbms_output.put_line(row.name);
    end loop;
  else
    dbms_output.put_line('! ! ! INVALID INPUT ! ! !');
  end if;
end;

set serveroutput on;
execute CustomerReport('ahmet');

-- ******************** 2 ********************
*/


