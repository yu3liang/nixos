{ ... }:

{
  # Disables the legacy PulseAudio server.
  services.pulseaudio.enable = false;
  # Enables the real-time kit daemon, which allows audio processes to get real-time CPU scheduling (reduces audio glitches).
  security.rtkit.enable = true;
  services.pipewire = {
    # Enables PipeWire
    enable = true;
    # Enables ALSA (Advanced Linux Sound Architecture) support.
    alsa.enable = true;
    # Adds 32-bit ALSA support (for compatibility with some apps/games).
    alsa.support32Bit = true;
    # Provides a PulseAudio-compatible server via PipeWire (so apps expecting PulseAudio still work).
    pulse.enable = true;
    # Enable JACK support for professional audio.
    # jack.enable = true;
  };
}
