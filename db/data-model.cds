namespace CAPM_madhu.db;

using { managed } from '@sap/cds/common';

entity Computers1
{
    key ID : Integer;
    name : String;
    model : String;
    unitprice : Integer;
    stock : Integer;
}

entity Customers1
{
    key ID : Integer;
    name : String(100);
    address : String(100);
    phone : String(100);
}

entity Sales1 : managed
{
    key ID : UUID
        @Core.Computed;
    customerID : Integer;
    computerID : Integer;
    price : Decimal;
}

entity sales_overview1 as
    select key sal.ID as salesID,
    sal.customerID as customerID,
    cust.name as customerName,
    cust.address as customerAddress,
    cust.phone as customerPhone,
    com.ID as computerID,
    com.name as computerName,
    sal.price as salesAmount from Sales1 as sal
    left join Customers1 as cust
        on sal.customerID = cust.ID
    left join Computers1 as com
        on sal.computerID = com.ID;