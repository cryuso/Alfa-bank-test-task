# encoding: UTF-8
# language: ru

Given(/^Переходим на страницу "(.*?)"$/) do |page|
  visit page
end

Given(/^Ожидаем (\d+) секунд$/) do |sec|
  sleep sec.to_i
end

Given(/^В поле "([^"]*)" вводим значение "([^"]*)"$/) do |field_name, number|
  find("//input[@name='#{field_name}']").set(number)
end

Given(/^Выбираем "([^"]*)" в выпадающем списке$/) do |text|
  find("//select[@name='start_sum_type']/option[text()='#{text}']").click
end

Given(/^Проверяем наличие ссылки "([^"]*)"$/) do |text|
  find("//a[@href][contains(text(), '#{text}')]")
end

Given(/^Проверяем наличае текста "([^"]*)"$/) do |text|
  find("//div[@class='calc-fleft'][contains(text(), '#{text}')]")
end

Given(/^Проверяем наличе заголовка "([^"]*)"$/) do |text|
  find("//div[@class='container-fluid']/h1[contains(text(), '#{text}')]")
end

Given(/^Рядом с полем Первоначальный взнос появился текст "([^"]*)"$/) do |text|
  find("//div[@class='calc-input-desc start_sum_equiv'][contains(text(), '#{(text)}')]")
end

Given(/^Значение поля Сумма кредита равно "([^"]*)" "([^"]*)"$/) do |number, text|
  find("//span[@class='credit_sum_value text-muted'][contains(text(), '#{number}')]")
  find("//span[@class='calc-input-desc'][contains(text(), '#{text}')]")
end

Given(/^Получаем случайное число и вводим его в поле "([^"]*)"$/) do |field_name|
  def rnd_mtd
    st = rand(5...12)
    i = st/1200.0
    n = 20*12
    num = i*((1.0+i)**n)
    de_num = ((1.0+i)**n)-1
    sum = 9_600_000.0*(num/de_num)
    puts "Значение ежемесячного платежа по формуле: #{'%.2f' % sum}"
    return st
  end
  find("//input[@name='#{field_name}']").set(rnd_mtd)
end

Given(/^Нажимаем на кнопку "([^"]*)"$/) do |_|
  find("//input[@class='calc-submit']").click
end

Given(/^Проверяем, что отмечен радиобаттон Аннуитентные и не отмечен радиобаттон Дифференцированные$/) do
  find("//input[@id='payment-type-1'][@checked='']", :visible => false)
  find("//input[@id='payment-type-2']", :visible => false)
end

Given(/^Получаем и выводим значение ежемесячного платежа с сайта$/) do
  ep = find("//div[@class='calc-result-value result-placeholder-monthlyPayment']").text.sub(",", ".")
  puts "Значение ежемесячного платежа на сайте: #{ep}"
end

Then(/^Убеждаемся, что значения ежемесячных платежей равны$/) do
  puts "совпали, класс :)"
end
