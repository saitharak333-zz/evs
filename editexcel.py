# Reading an excel file using Python
import xlrd
# Writing an excel file
import xlwt
from xlwt import Workbook

# Workbook is created
wb = Workbook()
sheet1 = wb.add_sheet('Sheet 1')

# To open Workbook
wb1 = xlrd.open_workbook('time_details.xlsx')
sheet = wb1.sheet_by_index(0)

# Itereated along the rows

for i in range(1, sheet.nrows):
    if sheet.cell_value(i,0) == '':
        sheet1.write(i, 0, st[-1])
    else:
        st = sheet.cell_value(i,0)
        st = st.split('/')
        print(st[-1])
        sheet1.write(i, 0, st[-1])
        print(sheet.cell_value(i,0))
else:
    wb.save('xlwt example.xls')

# Saved in example excel file
