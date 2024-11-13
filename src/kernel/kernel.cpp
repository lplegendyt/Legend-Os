// kernel.cpp
// This file contains the main entry point for the 64-bit kernel of Legend OS.

extern "C" void kernel_main() {
    // Display a message on the screen
    const char *message = "Welcome to 64-bit Legend OS!";
    unsigned short *video_memory = (unsigned short*) 0xB8000; // Video memory address for text mode

    // Loop through each character in the message and display it on the screen
    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i] = message[i] | 0x0F00; // Output the character in white color
    }

    // Infinite loop to keep the kernel running
    while (true); 
}
