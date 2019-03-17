# Reading an excel file using Python
import xlrd
# Writing an excel file
import xlwt
from xlwt import Workbook

# Workbook is created
wb = Workbook()
sheet1 = wb.add_sheet('Silence')
sheet2 = wb.add_sheet('Voiced')
sheet3 = wb.add_sheet('Unvoiced')
sheet4 = wb.add_sheet('transition')

# To open Workbook
wb1 = xlrd.open_workbook('time_details.xlsx')
sheet_1 = wb1.sheet_by_index(0)
sheet_2 = wb1.sheet_by_index(1)
sheet_3 = wb1.sheet_by_index(2)
sheet_4 = wb1.sheet_by_index(3)

# Itereated along the rows

for i in range(1, sheet_1.nrows):
    if sheet_1.cell_value(i,0) == '':
        sheet1.write(i, 0, st[-1])
        sheet1.write(i, 1, float(sheet_1.cell_value(i,1)))
        sheet1.write(i, 2, float(sheet_1.cell_value(i,2)))
    else:
        st = sheet_1.cell_value(i,0)
        st = st.split('/')
        # print(st[-1])
        sheet1.write(i, 0, st[-1])
        # print(sheet_1.cell_value(i,0))
        sheet1.write(i, 1, float(sheet_1.cell_value(i,1)))
        sheet1.write(i, 2, float(sheet_1.cell_value(i,2)))

for i in range(1, sheet_2.nrows):
    if sheet_2.cell_value(i,0) == '':
        sheet2.write(i, 0, st[-1])
        sheet2.write(i, 1, float(sheet_2.cell_value(i,1)))
        sheet2.write(i, 2, float(sheet_2.cell_value(i,2)))

    else:
        st = sheet_2.cell_value(i,0)
        st = st.split('/')
        # print(st[-1])
        sheet2.write(i, 0, st[-1])
        # print(sheet_2.cell_value(i,0))
        sheet2.write(i, 1, float(sheet_2.cell_value(i,1)))
        sheet2.write(i, 2, float(sheet_2.cell_value(i,2)))

for i in range(1, sheet_3.nrows):
    if sheet_3.cell_value(i,0) == '':
        sheet3.write(i, 0, st[-1])
        sheet3.write(i, 1, float(sheet_3.cell_value(i,1)))
        sheet3.write(i, 2, float(sheet_3.cell_value(i,2)))

    else:
        st = sheet_3.cell_value(i,0)
        st = st.split('/')
        # print(st[-1])
        sheet3.write(i, 0, st[-1])
        # print(sheet_3.cell_value(i,0))
        sheet3.write(i, 1, float(sheet_3.cell_value(i,1)))
        sheet3.write(i, 2, float(sheet_3.cell_value(i,2)))

for i in range(1, sheet_4.nrows):
    if sheet_4.cell_value(i,0) == '':
        sheet4.write(i, 0, st[-1])
        sheet4.write(i, 1, float(sheet_4.cell_value(i,1)))
    else:
        st = sheet_4.cell_value(i,0)
        st = st.split('/')
        # print(st[-1])
        sheet4.write(i, 0, st[-1])
        # print(sheet_4.cell_value(i,0))
        sheet4.write(i, 1, float(sheet_4.cell_value(i,1)))

# Saved in example excel file
wb.save('final.xlsx')
