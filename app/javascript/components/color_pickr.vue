<template>
  <div id="color">
    <input :value="color_code" type="hidden" name="emotion[color]" />
    <div class="columns is-multiline">
      <div class="column is-half">
        <div class="color-picker"></div>
      </div>
      <div class="column is-half">
        <div class="box color-sample" :style="'background-color:' + color_code + ';'"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Pickr from "@simonwep/pickr/dist/pickr.es5.min";

export default {
  data: function() {
    return {
      pickr: null
    };
  },
  computed: {
    color_code: function() {
      if (this.pickr) {
        return (
          "#" +
          this.pickr
            .getColor()
            .toRGBA()
            .splice(0, 3)
            .map(x => ("0" + Math.round(x).toString(16)).slice(-2))
            .join("")
        );
      } else {
        return "#000000";
      }
    }
  },
  mounted: function() {
    this.pickr = Pickr.create({
      el: ".color-picker",
      theme: "classic", // or 'monolith', or 'nano'
      useAsButton: true,
      lockOpacity: true,
      inline: true,
      showAlways: true,
      comparison: false,
      position: "bottom-end",
      swatches: [
        "rgb(244, 67, 54)",
        "rgb(233, 30, 99)",
        "rgb(156, 39, 176)",
        "rgb(103, 58, 183)",
        "rgb(63, 81, 181)",
        "rgb(33, 150, 243)",
        "rgb(3, 169, 244)",
        "rgb(0, 188, 212)",
        "rgb(0, 150, 136)",
        "rgb(76, 175, 80)",
        "rgb(139, 195, 74)",
        "rgb(205, 220, 57)",
        "rgb(255, 235, 59)",
        "rgb(255, 193, 7)"
      ],

      components: {
        // Main components
        palette: false,
        preview: false,
        opacity: true,
        hue: true,

        // Input / output Options
        interaction: {
          // hex: true,
          // rgba: true,
          // hsla: true,
          // hsva: true,
          // cmyk: true,
          // input: true,
          // clear: true,
          // save: true
        }
      }
    });
  }
};
</script>