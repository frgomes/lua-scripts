--
-- Make reference to QuickFIX tags from copied/pasted from documentation organized as a CSV file.
--
--   input looks like:  "20010","AccountName","String","N","Symbolic name of account."
--   output looks like: <field name="AccountName" required="N" />
--

prev=0
for line in io.input():lines() do
  for tag_, name_, type_, len_ in string.gmatch(line, '"(%w+)","(%w+)","(%w+)(%(*%d*%)*)"') do
    if (tag_ ~= prev) then
      print('  <field name="' .. name_ .. '" required="N" />')
    end
    prev=tag_
  end
end
