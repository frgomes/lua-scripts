--
-- Defines QuickFix tags from copied/pasted text from documentation organized as a CSV file.
--
--   input looks like:  "20010","AccountName","String","N","Symbolic name of account."
--   output looks like: <field number="20010" name ="AccountName" type="STRING" />
--

prev=0
for line in io.input():lines() do
  for tag_, name_, type_, len_ in string.gmatch(line, '"(%w+)","(%w+)","(%w+)(%(*%d*%)*)"') do
    if (tag_ ~= prev) then
      print('  <field number="' .. tag_ .. '" name="' .. name_ .. '" type="' .. string.upper(type_) .. '" />')
    end
    prev = tag_
  end
end
