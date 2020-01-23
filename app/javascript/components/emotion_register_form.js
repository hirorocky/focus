import ColorPickr from './color_pickr.vue'

export default {
  components: {
    ColorPickr
  },
  data: function () {
    return {
      fragments: [],
      recent_id: -1,
      input_content: "",
      input_tag: "",
      input_context: "",
      color: ""
    };
  },
  methods: {
    addFragment: function (event) {
      const tag = this.input_tag;
      const content = this.input_content;
      if (tag !== "" && content !== "") {
        this.fragments.push({
          tag: this.input_tag,
          content: this.input_content,
          id: this.nextId()
        });
        this.input_tag = "";
        this.input_content = "";
      }
    },
    nextId: function () {
      return ++this.recent_id;
    },
    onTagSuggestClicked: function (event) {
      this.input_tag = event.target.text;
    },
    deleteFragment: function (fragment) {
      const index = this.fragments.indexOf(fragment);
      this.fragments.splice(index, 1);
    }
  },
  computed: {
    is_disabled_add_fragment_btn: function () {
      const tag = this.input_tag;
      const content = this.input_content;
      if (tag !== "" && content !== "") {
        return false;
      } else {
        return true;
      }

    }
  }
}