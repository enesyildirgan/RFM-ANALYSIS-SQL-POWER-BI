# SQL ve Power BI ile RFM Analizi Projesi

## 📖 Proje Hakkında
Bu proje, OnlineRetail veri seti üzerinden müşteri davranışlarını analiz ederek stratejik segmentasyon oluşturmak amacıyla geliştirilmiştir. Analiz süreci, veritabanı yönetim sisteminde (SQL) verinin işlenmesiyle başlamış ve İş Zekası (Power BI) aracıyla görselleştirilerek tamamlanmıştır.

---

## 🎯 Analiz Kriterleri (RFM)
Müşteri sadakatini ölçmek için kullanılan üç temel metrik temel alınmıştır:

* **Recency (Yenilik):** Müşterinin son alışverişinden bugüne geçen süre.
* **Frequency (Sıklık):** Toplam alışveriş sayısı.
* **Monetary (Parasal Değer):** Toplam harcama tutarı.

---

## 🛠 Uygulama Adımları
1. **Veri Hazırlama (SQL):** Ham veriler temizlendi ve her müşteri için RFM değerleri hesaplandı.
2. **Skorlama:** `NTILE(5)` fonksiyonu kullanılarak her metrik için 1'den 5'e kadar puanlama yapıldı.
3. **Segmentasyon:** Skor kombinasyonlarına göre müşteriler; *Champions, Loyal Customers, At Risk* gibi stratejik gruplara ayrıldı.
4. **Görselleştirme (Power BI):** Hazırlanan veriler Power BI ortamına aktarılarak interaktif bir dashboard oluşturuldu.

---

## 📈 Proje Çıktıları
* Müşteri kitlesinin segment bazlı yüzdesel dağılımı belirlendi.
* En değerli müşteri grubunun toplam cirodaki payı analiz edildi.
* Kaybedilmek üzere olan müşteriler için aksiyon planları oluşturuldu.

---

## 📂 Proje İçeriği
* **`/SQL_Scripts`**: Veri hazırlama ve segmentasyon sorguları.
* **`/PowerBI_Report`**: Projenin `.pbix` formatındaki rapor dosyası.
* **`/Screenshots`**: Power BI dashboard görüntüsü.
* **`/Data`**: Projede kullanılan excel veri seti dosyası (OnlineRetail).

---

## 🔗 Detaylı Anlatım
Projenin tüm teknik detaylarına ve adım adım uygulama rehberine aşağıdaki Medium yazımdan ulaşabilirsiniz:

👉 [Medium - SQL ve Power BI ile RFM Analizi](https://medium.com/@yildirganenes/sql-ve-power-bi-kullanarak-rfm-analizi-402a1bfd5a45)
