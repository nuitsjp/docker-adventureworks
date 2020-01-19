CREATE TABLE [ErrorLog](
    [ErrorLogID] INTEGER PRIMARY KEY AUTOINCREMENT,
    [ErrorTime] DATETIME NOT NULL DEFAULT (datetime('now')),
    [UserName] TEXT NOT NULL, 
    [ErrorNumber] INTEGER NOT NULL, 
    [ErrorSeverity] INTEGER NULL, 
    [ErrorState] INTEGER NULL, 
    [ErrorProcedure] TEXT NULL, 
    [ErrorLine] INTEGER NULL, 
    [ErrorMessage] TEXT NOT NULL
);

CREATE TABLE [BuildVersion](
    [SystemInformationID] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Database Version] TEXT NOT NULL, 
    [VersionDate] DATETIME NOT NULL, 
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE [Address](
    [AddressID] INTEGER PRIMARY KEY,
    [AddressLine1] TEXT NOT NULL, 
    [AddressLine2] TEXT NULL, 
    [City] TEXT NOT NULL, 
    [StateProvince] TEXT NOT NULL,
	[CountryRegion] TEXT NOT NULL,
    [PostalCode] TEXT NOT NULL, 
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE [Customer](
    [CustomerID] INTEGER PRIMARY KEY AUTOINCREMENT,
    [NameStyle] INTEGER NOT NULL DEFAULT (0),
    [Title] TEXT NULL, 
    [FirstName] TEXT NOT NULL,
    [MiddleName] TEXT NULL,
    [LastName] TEXT NOT NULL,
    [Suffix] TEXT NULL, 
	[CompanyName] TEXT NULL,
	[SalesPerson] TEXT,
    [EmailAddress] TEXT NULL, 
    [Phone] TEXT NULL, 
    [PasswordHash] TEXT NOT NULL, 
    [PasswordSalt] TEXT NOT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE [CustomerAddress](
	[CustomerID] INTEGER  NOT NULL,
	[AddressID] INTEGER NOT NULL,
	[AddressType] TEXT NOT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE [Product](
    [ProductID] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Name] TEXT NOT NULL,
    [ProductNumber] TEXT NOT NULL, 
    [Color] TEXT NULL, 
    [StandardCost] INTEGER NOT NULL,
    [ListPrice] INTEGER NOT NULL,
    [Size] TEXT NULL, 
    [Weight] INTEGER NULL,
    [ProductCategoryID] INTEGER NULL,
    [ProductModelID] INTEGER NULL,
    [SellStartDate] DATETIME NOT NULL,
    [SellEndDate] DATETIME NULL,
    [DiscontinuedDate] DATETIME NULL,
    [ThumbNailPhoto] BLOB NULL,
    [ThumbnailPhotoFileName] TEXT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE [ProductCategory](
    [ProductCategoryID] INTEGER PRIMARY KEY AUTOINCREMENT,
	[ParentProductCategoryID] INTEGER NULL,
    TEXT TEXT NOT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now')) 
);

CREATE TABLE [ProductDescription](
    [ProductDescriptionID] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Description] TEXT NOT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now')) 
);

CREATE TABLE [ProductModel](
    [ProductModelID] INTEGER PRIMARY KEY AUTOINCREMENT,
    TEXT TEXT NOT NULL,
    [CatalogDescription] TEXT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now')) 
);

CREATE TABLE [ProductModelProductDescription](
    [ProductModelID] INTEGER NOT NULL,
    [ProductDescriptionID] INTEGER NOT NULL,
    [Culture] TEXT NOT NULL, 
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now')) 
);

CREATE TABLE [SalesOrderDetail](
    [SalesOrderID] INTEGER NOT NULL,
    [SalesOrderDetailID] INTEGER IDENTITY (1, 1) NOT NULL,
    [OrderQty] INTEGER NOT NULL,
    [ProductID] INTEGER NOT NULL,
    [UnitPrice] INTEGER NOT NULL,
    [UnitPriceDiscount] INTEGER NOT NULL DEFAULT (0.0),
    --[LineTotal] AS ISNULL([UnitPrice] * (1.0 - [UnitPriceDiscount]) * [OrderQty], 0.0),
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE [SalesOrderHeader](
    [SalesOrderID] INTEGER PRIMARY KEY AUTOINCREMENT,
    [RevisionNumber] INTEGER NOT NULL DEFAULT (0),
    [OrderDate] DATETIME NOT NULL CONSTRAINT [DF_SalesOrderHeader_OrderDate] DEFAULT (datetime('now')),
    [DueDate] DATETIME NOT NULL,
    [ShipDate] DATETIME NULL,
    [Status] INTEGER NOT NULL DEFAULT (1),
    [OnlineOrderFlag] INTEGER NOT NULL DEFAULT (1),
    --[SalesOrderNumber] AS ISNULL(N'SO' + CONVERT(nvarchar(23), [SalesOrderID]), N'*** ERROR ***'), 
    [PurchaseOrderNumber] INTEGER NULL,
    [AccountNumber] TEXT NULL,
    [CustomerID] INTEGER NOT NULL,
	[ShipToAddressID] int,
	[BillToAddressID] int,
    [ShipMethod] TEXT NOT NULL,
    [CreditCardApprovalCode] TEXT NULL,    
    [SubTotal] INTEGER NOT NULL DEFAULT (0.00),
    [TaxAmt] INTEGER NOT NULL DEFAULT (0.00),
    [Freight] INTEGER NOT NULL DEFAULT (0.00),
    --[TotalDue] AS ISNULL([SubTotal] + [TaxAmt] + [Freight], 0),
    [Comment] TEXT NULL,
    [ModifiedDate] DATETIME NOT NULL DEFAULT (datetime('now'))
);
