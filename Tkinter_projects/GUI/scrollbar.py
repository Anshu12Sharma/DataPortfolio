#import tkinter
from tkinter import*
root=Tk()
root.title("Anshu GUI")
root.geometry("1350x700+0+0")
root.config(bg="pink")
'''
lbl=Label(root,text="Sharma",font="black").place(x=200,y=300)
lbl=Label(root,text="Anshu",font="34").place(x=600,y=350)

'''
Frame1=Frame(root,bd=2,relief=RIDGE)
Frame1.place(x=250,y=50,height=300,width=200)

scrooly=Scrollbar(Frame1,orient=VERTICAL)
scrooly.pack(side=RIGHT,fill=Y)
data=Listbox(Frame1,font=("times new roman",20),justify=CENTER)
data.pack()

for i in range(0,11):
    data.insert(i,"DATA:" +str(i))
root.mainloop()
