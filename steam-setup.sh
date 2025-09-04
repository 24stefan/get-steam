# This script automates setup of steam on Arch Linux
# It's made for people that want to use Steam on Arch, but don't want to invest time in setting it up.
# Code bellow will be documented thoroughly using comments
# credits: @24stefan

#---------------------Instalation-----------------
# wiki.archlinux: Enable the multilib repository and install the steam package (recommended)

# Enable the multilib repository
 enable_multilib() {
    local conf="/etc/pacman.conf"

    # check to see if it's already enabled
    if grep -q "^\[multilib\]" "$conf" ; then
        echo "Multilib is already enabled."
      else
          echo "Enabling multilib...."
          sudo sed -i '/#\[multilib\]/,/#Include/s/^#//' "$conf"
    fi


    echo "Updating package databases...(sudo pacman -Sy)"
    sudo pacman -Sy
 }



 # install the steam package

 install_steam_package(){
   
   echo "Updating package databases...(sudo pacman -Sy)"
   sudo pacman -Sy

   echo "Installing Steam"

   sudo pacman -S --needed steam

 }

 
 resolve_steam_dependencies() {
    echo " Resolving common Steam dependencies "

    echo " Installing fonts -> ttf-liberation as Arial replacement..."
    sudo pacman -S --needed ttf-liberation

    echo " Installing 32-bit systemd library, needed if using systemd-networkd..."
    sudo pacman -S --needed lib32-systemd

    echo " Installing 32-bit PipeWire, if you use PipeWire for audio..."
    sudo pacman -S --needed lib32-pipewire

    echo " Installing XDG Desktop Portal (needed for file chooser dialogs)..."
    sudo pacman -S --needed xdg-desktop-portal xdg-desktop-portal-gtk

    echo "GPU drivers (choose the right one for your hardware) "
    echo "AMD Vulkan:     sudo pacman -S lib32-amdvlk"
    echo "AMD RADV:       already included in mesa/lib32-mesa"
    echo "Intel Vulkan:   sudo pacman -S lib32-vulkan-intel"
    echo "NVIDIA Vulkan:  sudo pacman -S lib32-nvidia-utils"

    echo " Locale setup "
    if ! grep -q "en_US.UTF-8 UTF-8" /etc/locale.gen; then
        echo "⚙ Adding en_US.UTF-8 UTF-8 to /etc/locale.gen"
        echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
    fi
    echo " Generating locales..."
    sudo locale-gen

    echo " Kernel parameter: vm.max_map_count "
    echo " Some games require vm.max_map_count >= 1048576"
    echo "You can set it temporarily with:"
    echo "  sudo sysctl -w vm.max_map_count=1048576"
    echo "Or persist it by adding 'vm.max_map_count=1048576' to /etc/sysctl.d/99-steam.conf"

    echo " Done. "

    


 

 # -----------------------------------------------------------------------------------------------------------------------