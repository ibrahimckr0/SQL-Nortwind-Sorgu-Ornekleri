--Fiyati ortalama fiyatin altinda olan urunleri getiren sorgu
Select
	ProductName,
	UnitPrice
From Products
Where UnitPrice<AVG (UnitPrice)

--Where ifadesi ile birlikte aggregate function lardan herhangi birisi direkt kullanılmaz. Onun yerine subquery (alt sorgu) lardan yaralanılır.

select
	ProductName,
	UnitPrice

from Products
where UnitPrice<(select avg(UnitPrice) from Products)


-- En pahali 3 urun
Select Top 5
	UnitPrice
From Products
Order By UnitPrice desc



--Hangi  ulkelere is yapiyoruz--> Customers
Select
	Distinct Country
From Customers

--Distinct benzersizlik için kullanılır.

--Kac farki ulkeye siparis gonderilmis--> sayisi!!! --> Orders-->ShipCountry
Select
	 Count (Distinct ShipCountry)
From Orders

--Hangi kategoride(CategoryID) kac adet urun bulunmaktadir-->Products --> Count
Select
	CategoryID,
	COUNT (*) as 'UrunSayisi'
From Products
Group By CategoryID










--Ulkelere gore(Country) calisan sayisini veren sorgu-->Employees
Select 
Country,
Count(*)

From Employees
Group By Country




--Her kategoride(CategoryID) ucret bazli toplam ne kadarlik urun oldugu bilgisini veren sorgu==>Products

Select 
CategoryID,
Sum(UnitPrice*UnitsInStock) as 'Toplam Ürün Fiyatı'
From Products
Group By CategoryID

-----

--Hangi kategoriden kaç adet ürün var ==>Products
Select
CategoryID,
sum(UnitsInStock) as 'Stok Bilgisi'
From Products 
Group By CategoryID



--Ülkelere giden kargolarin ülke bazında ortalama taşıma ücretleri ? Orders ==> Freight (Kargo Ücreti)
Select
ShipCountry as 'Ülkeler' ,
AVG(Freight) as 'OrtalamaTasimaUcreti'
From Orders
Group By ShipCountry
order by OrtalamaTasimaUcreti asc



--Hangi ülkede kaç müşterim var. Müşteri sayısına göre çoktan aza doğru sıralayınız.. Customers
Select 
Country,
Count(CustomerID) MusteriSayisi
From Customers
group by Country  
order by MusteriSayisi desc -- veya order by 2 desc  




