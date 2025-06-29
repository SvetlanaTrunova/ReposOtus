
//@skip-check module-structure-method-in-regions
Процедура ЗаписьЗаказаПоставщикаПриЗаписи(Источник, Отказ) Экспорт
	ДатаНачала 		= НачалоНедели(Источник.Дата);
	ДатаОкончания 	= КонецНедели(Источник.Дата);
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СУММА(1) КАК СуммаЗаказов
		|ИЗ
		|	Документ.ЗаказыПоставщикам КАК ЗаказыПоставщикам
		|ГДЕ
		|	ЗаказыПоставщикам.Поставщик = &Поставщик
		|	И ЗаказыПоставщикам.Дата МЕЖДУ &ДатаНачала И &ДатаОкончания";
	
	Запрос.УстановитьПараметр("ДатаНачала", 	ДатаНачала);
	Запрос.УстановитьПараметр("ДатаОкончания", 	ДатаОкончания);
	Запрос.УстановитьПараметр("Поставщик", 		Источник.Поставщик);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	ВыборкаДетальныеЗаписи.Следующий();
	
	ТекстВывода = СтрШаблон("За эту неделю (%1-%2) по поставщику %3 зафиксировано заказов в количестве %4шт.", 
																	Формат(ДатаНачала, "ДФ=дд.ММ.гг"), 
																	Формат(ДатаОкончания, "ДФ=дд.ММ.гг"), 
																	Источник.Поставщик, 
																	ВыборкаДетальныеЗаписи.СуммаЗаказов);
																	
	Сообщить(ТекстВывода);	
	// Код процедур и функций
	// Код процедур и функций
	// Код процедур и функций ит
	// Ветка Трунова
	// Последние измеения
	
КонецПроцедуры
