alter table test.Product add Price int;

alter procedure PriceFix (@p_count int output)
as
	declare c cursor for select nID, pID, price, purchaseCount from test.Purchase
	declare @p_price int;
	declare @v_nID int;
	declare @v_pID int;
	declare @v_price int;
	declare @v_purchaseCount int;
begin
	open c;
	fetch next from c into @v_nID, @v_pID, @v_price, @v_purchaseCount;
	while @@FETCH_STATUS = 0
	begin
		select @p_price = price from test.Product where pID = @v_pID;
		if @p_price * @v_purchaseCount != @v_price
		begin
			update test.Purchase set price = @p_price * @v_purchaseCount where nID = @v_nID;
		end			
		fetch next from c into @v_nID, @v_pID, @v_price, @v_purchaseCount;
		set @p_count = @p_count + 1;
	end
	close c;
	deallocate c;
	--print @p_count
end

declare @temp int = 0;
exec PriceFix @temp output
select @temp COUNT; 



alter procedure InsertComplaint 
(
	@p_nID int, 
	@p_length int, 
	@p_price int
)
as
	declare @v_count int;
begin
	select @v_count = count(*) from test.Purchase where nID = @p_nID;
	if @v_count = 1
	begin
		select @v_count = count(*) from test.Complaint where nID = @p_nID;
		if @v_count = 3
		begin
			delete from test.Complaint where nID = @p_nID;
			delete from test.Purchase where nID = @p_nID;
		end
		else
			insert into test.Complaint values(@p_nID, @v_count + 1, @p_length, @p_price);		
	end
	else
		print 'WARNING'
end

execute InsertComplaint 26, 4, 180

select * from test.Complaint;
select * from test.Customer;
select * from test.Product;
select * from test.Purchase;

