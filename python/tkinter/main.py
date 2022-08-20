import tkinter as tk

window = tk.Tk()

label = tk.Label(window, text="Simple label")
label.pack()

frame = tk.Frame(window, width=100, height=30, bg="Blue")
frame.pack()

button = tk.Button(window, text="Button")
button.pack(fill=tk.X)

switch = tk.IntVar()
switch.set(1)

checkbutton = tk.Checkbutton(window, text="Check button", variable=switch)
checkbutton.pack()

entry = tk.Entry(window, width=30)
entry.pack()

radiobutton1 = tk.Radiobutton(window, text="one", variable=switch, value=0)
radiobutton1.pack()
radiobutton2 = tk.Radiobutton(window, text="two", variable=switch, value=1)
radiobutton2.pack()

window.mainloop()
