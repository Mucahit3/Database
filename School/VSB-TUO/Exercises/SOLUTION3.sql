alter table Complaint add p_start date;

select * from Complaint;
update Complaint set p_start = null; --to_date('01-01-2014','DD-MM-YYYY');
update Complaint set p_start = null where nID = 1 and complaintOrder = 2;

create or replace procedure AddComplaint(v_nID int, v_start date, v_duration int, v_price int)
as
  p_count int;
  p_purchaseDay date;
  c_start date;
  p_duration int;
begin
  select count(*) into p_count from Purchase where v_nID = nID;
  if(p_count = 1) then
    select count(*) into p_count from Complaint where v_nID = nID; 
    select purchaseDay into p_purchaseDay from Purchase where v_nID = nID;
    select p_start into c_start from Complaint where v_nID = nID and complaintOrder = p_count;
    select duration into p_duration from Complaint where v_nID = nID and complaintOrder = p_count;
    if(v_start <= sysdate and v_start > p_purchaseDay and c_start != null) then
      if(v_start > c_start + p_duration) then
          if (v_count < 3) then
            if(v_duration < 0 or v_price < 0) then
              insert into Complaint(nID, complaintOrder, p_start) values (p_nID, v_count + 1, v_start );
            else
              insert into Complaint values (p_nID, v_count + 1, p_duration, p_price, v_start);
            end if
            dbms_output.put_line('Complaint has been saved.');            
          end if;
      end if;
    end if;  
  end if;
  commit
  exception
    when others then
      rollback;
end;

execute AddComplaint(1, '04/08/2014', 5, 100);












