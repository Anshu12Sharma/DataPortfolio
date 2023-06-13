#import tkinter
from tkinter import*
root=Tk()
root.title("user form")
root.geometry("500x350+0+0")
root.config(bg="pink")


def get_name():
   # print(txt_Entry.get())
   lbl_result.config(text=str(txt_Entry.get()))


lbl=Label(root,text="FORM",font="black").pack(fill=X)
lbl=Label(root,text="User Name",font="25").place(x=50,y=75)
txt_Entry=Entry(root,font=("times new roman",23,"bold"),bg="white")
txt_Entry.place(x=250, y=75)
Gender=Label(root,text="Gender",font=("times new roman",25,"bold"),bg="white").place(x=50,y=150)
male=Radiobutton(root,text="female").place(x=200,y=150)
btn_get=Button(root,text="Show",cursor="hand2",command=get_name).place(x=350,y=200)
lbl_result=Label(root,font=("times new roman",25,"bold"),bg="white")
lbl_result.place(x=0,y=300)

root.mainloop()
