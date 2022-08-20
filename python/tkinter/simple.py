import tkinter as tk

from tkinter import messagebox


def click():
    replay = messagebox.askquestion("Quit?", "Are you sure?")
    if replay == 'yes':
        root.destroy()

root = tk.Tk()
root.title("Sample")
button = tk.Button(root, text="Bye!", command=click)
button.place(x=10, y=10)

root.mainloop()
