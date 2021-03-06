CREATE TABLE E_SHOP_WAREHOUSE(
WAREHOUSE_ID NUMBER(4) NOT NULL,
WAREHOUSE_NAME VARCHAR2(50) NOT NULL,
CAPACITY NUMBER,
UNIT VARCHAR2(50),
CREATION_DATE DATE,
CONSTRAINT pk_warehouse_id PRIMARY KEY (WAREHOUSE_ID)
);

CREATE TABLE E_SHOP_ITEMS(
ITEM_ID NUMBER(12) NOT NULL,
DESCRIPTION VARCHAR2(200),
NAME VARCHAR2(50) NOT NULL,
WEIGHT NUMBER(10,3) NOT NULL,
INVENTORY_STATUS VARCHAR2(20),
SELLABLE_STATUS VARCHAR2(20) NOT NULL,
CONSTRAINT pk_item_id PRIMARY KEY (ITEM_ID)
);

CREATE TABLE E_SHOP_AVAILABILITY(
WAREHOUSE_ID NUMBER(4) NOT NULL,
ITEM_ID NUMBER(12) NOT NULL,
QUANTITY NUMBER(12) NOT NULL,
CREATION_DATE DATE,
CONSTRAINT fk_warehouse_id FOREIGN KEY (WAREHOUSE_ID) REFERENCES E_SHOP_WAREHOUSE (WAREHOUSE_ID),
CONSTRAINT fk_item_id FOREIGN KEY (ITEM_ID) REFERENCES E_SHOP_ITEMS (ITEM_ID)
);

CREATE TABLE E_SHOP_ADDRESS(
ADDRESS_ID NUMBER(12) NOT NULL,
ADDRESS_NAME VARCHAR2(100) UNIQUE,
STREET_NAME VARCHAR2(150)NOT NULL,
BUILDING_NR VARCHAR2(50),
OFFICE_NR VARCHAR2(50),
COUNTRY VARCHAR2(50) NOT NULL,
CITY VARCHAR2(50),
POSTAL_CODE VARCHAR2(20) NOT NULL,
CONSTRAINT pk_address_id PRIMARY KEY (ADDRESS_ID)
);

CREATE TABLE E_SHOP_CUSTOMERS(
CUSTOMER_ID NUMBER(12) NOT NULL,
CUSTOMER_NAME VARCHAR2(50) NOT NULL UNIQUE,
ACCOUNT_NUMBER VARCHAR2(100) NOT NULL,
STATUS VARCHAR2(20),
ADDRESS_ID NUMBER(12) NOT NULL,
EMAIL VARCHAR2(50) NOT NULL,
PHONE_NUMBER VARCHAR2(30),
CREATION_DATE DATE,
CONSTRAINT pk_customer_id PRIMARY KEY (CUSTOMER_ID),
CONSTRAINT fk_address_id FOREIGN KEY (ADDRESS_ID) REFERENCES E_SHOP_ADDRESS (ADDRESS_ID)
);

CREATE TABLE E_SHOP_ORDERS(
ORDER_ID NUMBER(12) NOT NULL,
ORDER_NUMBER VARCHAR(50) NOT NULL,
CUSTOMER_ID NUMBER(12) NOT NULL,
SHIPMENT_DATE DATE NOT NULL,
STATUS VARCHAR2(20) NOT NULL,
TOTAL_AMOUNT NUMBER(10),
CURRENCY VARCHAR2(20) NOT NULL,
WAREHOUSE_ID NUMBER(4) NOT NULL,
ORDER_DATE DATE NOT NULL,
CREATION_DATE DATE,
CONSTRAINT pk_order_id PRIMARY KEY (ORDER_ID),
CONSTRAINT fk_customer_id FOREIGN KEY (CUSTOMER_ID) REFERENCES E_SHOP_CUSTOMERS (CUSTOMER_ID),
CONSTRAINT fk_warehouse FOREIGN KEY (WAREHOUSE_ID) REFERENCES E_SHOP_WAREHOUSE (WAREHOUSE_ID)
);

CREATE TABLE E_SHOP_ORDER_LINES(
LINE_ID NUMBER(12) NOT NULL,
ORDER_ID NUMBER(12) NOT NULL,
LINE_NUMBER NUMBER(5) NOT NULL,
ITEM_ID NUMBER(12) NOT NULL,
UNIT_PRICE NUMBER(10,2) NOT NULL,
QUANTITY NUMBER(7) NOT NULL,
STATUS VARCHAR2(20) NOT NULL,
UOM VARCHAR2(20)NOT NULL,
CONSTRAINT pk_line_id PRIMARY KEY (LINE_ID),
CONSTRAINT fk_order_id FOREIGN KEY (ORDER_ID) REFERENCES E_SHOP_ORDERS (ORDER_ID),
CONSTRAINT fk_item FOREIGN KEY (ITEM_ID) REFERENCES E_SHOP_ITEMS (ITEM_ID)
);
