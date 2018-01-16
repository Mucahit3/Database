/*
-- ****************** 1 ******************
alter function LoginExist(@p_nID int)
RETURNS BIT
AS
BEGIN
  DECLARE @v_ret BIT;
  IF EXISTS(select * from test.Purchase where nID = @p_nID)
    SET @v_ret = 1;
  ELSE
    SET @v_ret = 0;
    
  RETURN @v_ret;
END

alter procedure AddComplaint 
(
	@p_nID int, 
	@p_complaintorder int, 
	@p_duration int,
	@p_price int
)
as
	declare @v_count int = 0;
	declare @v_complaint_price int;
	declare	@v_purchase_price int;
	declare @v_pID int;
	declare @v_temp varchar(50);
begin
	select @v_count = count(*) from test.Purchase where nID = @p_nID
	begin transaction
		begin try 
			if @v_count = 1 
				begin
					select @v_complaint_price = sum(price) from test.Complaint where nID = @p_nID; 
					select @v_purchase_price = price from test.Purchase where nID = @p_nID;
					if @v_complaint_price + @p_price > @v_purchase_price
						begin
							select @v_pID = pID from test.Purchase where nID = @p_nID;
							update test.Product set lastProductionYear = 2017 where pID = @v_pID;
							print 'Product with the serial number ' + CAST(@v_pID as varchar) + ' has been taken out of production.';
						end
					else
						begin	
							insert into test.Complaint values(@p_nID, @p_complaintorder, @p_duration, @p_price);
							print('Complaint has been saved successfully');
						end;
				end
			else
				set @v_temp = 'The purchase with the nID = ' + CAST(@p_nID as varchar) + ' does not exist.'
				print(@v_temp);
			commit;
		end try
		begin catch
			rollback;
		end catch
end
go

execute AddComplaint 25,7,1,3000
select * from test.Complaint;
select * from test.Product;

-- ****************** 1 ******************
*/

-- ****************** 2 ******************


alter procedure CustomerReport (@p_order varchar(50))
as
	declare z cursor for select name from test.Customer order by name; 
	declare @v_name varchar(50);
	declare e cursor for select test.Customer.cID, name, count(nID)  from test.Customer, test.Purchase 
	where test.Customer.cID = test.Purchase.cID group by test.Customer.cID, name order by count(nID) desc;
	declare @temp1 int;
	declare @temp2 varchar(30);
	declare @temp3 int;
	declare f cursor for select test.Customer.cID, name, count(test.Complaint.nID)  from test.Customer,test.Purchase, test.Complaint 
	where test.Customer.cID = test.Purchase.cID and test.Purchase.nID = test.Complaint.nID
	group by test.Customer.cID, name order by count(test.Complaint.nID) desc;	
	declare @temp4 int;
	declare @temp5 varchar(30);
	declare @temp6 int;
begin
	if @p_order = 'name'
		begin
			open z;
			fetch next from z into @v_name;
			while @@FETCH_STATUS = 0
			begin
				print(@v_name);
				fetch next from z into @v_name;
			end	
			close z;
			deallocate z;
		end
	else if @p_order = 'purchase'
		begin
			open e;
			fetch next from e into @temp1, @temp2, @temp3;
			while @@FETCH_STATUS = 0
			begin
				print(@temp2);
				fetch next from e into @temp1, @temp2, @temp3;
			end	
			close e;
			deallocate e;
		end
	else if @p_order = 'complaint'
		begin
			open f;
			fetch next from f into @temp4, @temp5, @temp6;
			while @@FETCH_STATUS = 0
			begin
				print(@temp5);
				fetch next from f into @temp4, @temp5, @temp6;
			end	
			close f;
			deallocate f;
		end
	else
		print 'INVALID INPUT';	
end

execute CustomerReport 'name';

-- ****************** 2 ******************