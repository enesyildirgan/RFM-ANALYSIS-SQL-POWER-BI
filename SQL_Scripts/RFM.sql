-- VERÝ SETÝNÝN ÝNCELENMESÝ
SELECT *FROM OnlineRetail


-- TABLO OLUÞTURULMASI
CREATE TABLE RFM_ANALYSIS
(
CustomerID int,
LastInvoiceDate DATETIME,
Recency int,
Frequency int,
Monetary int,
RecencyScala int,
FrequencyScala int,
MonetaryScala int,
Segment VARCHAR(50)
)

--CustomerID kolonunun doldurulmasý

INSERT INTO RFM_ANALYSIS 
(CustomerID)

SELECT  DISTINCT CustomerID  FROM OnlineRetail

--LastInvoiceDate Kolonunun Doldurulmasý

UPDATE RFM_ANALYSIS SET LastInvoiceDate=B.InvoiceDate
FROM  RFM_ANALYSIS A 
LEFT JOIN (SELECT CustomerID,MAX(InvoiceDate) AS InvoiceDate  FROM OnlineRetail  GROUP BY CustomerID ) AS B   ON A.CustomerID=B.CustomerID



--Recency Kolonun Doldurulmasý

SELECT MAX(InvoiceDate) son_tarih  FROM OnlineRetail

UPDATE RFM_ANALYSIS SET Recency= DATEDIFF(DAY,LastInvoiceDate,'20120101')

--Frequency Kolonun Doldurulmasý

UPDATE RFM_ANALYSIS SET Frequency=B.InvoiceNo  FROM RFM_ANALYSIS A
LEFT JOIN (SELECT CustomerID,COUNT(DISTINCT(InvoiceNo)) as InvoiceNo FROM OnlineRetail GROUP BY CustomerID) B ON A.CustomerID=B.CustomerID

--Monetary Kolonunun Doldurulmasý
UPDATE RFM_ANALYSIS SET Monetary=B.TotalAmount  FROM RFM_ANALYSIS A
LEFT JOIN (SELECT CustomerID,sum(Quantity*UnitPrice) as TotalAmount FROM OnlineRetail GROUP BY CustomerID) B ON A.CustomerID=B.CustomerID



--RecencyScala Kolonunun Doldurulmasý
UPDATE RFM_ANALYSIS SET RecencyScala=b.RecencyScala 
FROM RFM_ANALYSIS A LEFT JOIN (SELECT CustomerID,NTILE(5) OVER(ORDER BY Recency DESC) as RecencyScala
FROM RFM_ANALYSIS )
AS B ON A.CustomerID=B.CustomerID


--FrequencyScala Kolonunun Doldurulmasý
UPDATE RFM_ANALYSIS SET FrequencyScala=b.FrequencyScala 
FROM RFM_ANALYSIS A LEFT JOIN (SELECT CustomerID,NTILE(5) OVER(ORDER BY Frequency ) as FrequencyScala
FROM RFM_ANALYSIS )
AS B ON A.CustomerID=B.CustomerID


--MonetaryScala Kolonunun Doldurulmasý
UPDATE RFM_ANALYSIS SET MonetaryScala=b.MonetaryScala 
FROM RFM_ANALYSIS A LEFT JOIN (SELECT CustomerID,NTILE(5) OVER(ORDER BY Monetary ) as MonetaryScala
FROM RFM_ANALYSIS )
AS B ON A.CustomerID=B.CustomerID

--Segment Kolonunun Doldurulmasý
UPDATE RFM_ANALYSIS SET Segment='Hibernating'
where RecencyScala LIKE '[1-2]%' AND FrequencyScala LIKE '[1-2]%'

UPDATE RFM_ANALYSIS SET Segment='At_Risk'
where RecencyScala LIKE '[1-2]%' AND FrequencyScala LIKE '[3-4]%'

UPDATE RFM_ANALYSIS SET Segment='Cant_Loose'
where RecencyScala LIKE '[1-2]%' AND FrequencyScala LIKE '[5]%'

UPDATE RFM_ANALYSIS SET Segment='About_To_Sleep'
where RecencyScala LIKE '[3]%' AND FrequencyScala LIKE '[1-2]%'

UPDATE RFM_ANALYSIS SET Segment='Need_Attention'
where RecencyScala LIKE '[3]%' AND FrequencyScala LIKE '[3]%'

UPDATE RFM_ANALYSIS SET Segment='Loyal_Customers'
where RecencyScala LIKE '[3-4]%' AND FrequencyScala LIKE '[4-5]%'

UPDATE RFM_ANALYSIS SET Segment='Promising'
where RecencyScala LIKE '[4]%' AND FrequencyScala LIKE '[1]%'

UPDATE RFM_ANALYSIS SET Segment='New_Customers'
where RecencyScala LIKE '[5]%' AND FrequencyScala LIKE '[1]%'

UPDATE RFM_ANALYSIS SET Segment='Potential_Loyalists'
where RecencyScala LIKE '[4-5]%' AND FrequencyScala LIKE '[2-3]%'

UPDATE RFM_ANALYSIS SET Segment='Champions'
where RecencyScala LIKE '[5]%' AND FrequencyScala LIKE '[4-5]%'




select Segment,count(*) AS 'Müþteri Sayýsý' from RFM_ANALYSIS  GROUP BY Segment
ORDER  BY count(*) DESC

