jQuery responsiveText
====


A jQuery plugin to set font sizes responsively based on its' container width. Use *jQuery responsiveText* to have scalable headlines, build [responsive tables](https://github.com/ghepting/jquery-responsive-tables) and more!

View the demo at [http://garyhepting.com/jquery-responsive-text]


Installation:
----

Initialize the plugin:

```html
<script type="text/javascript">
  $(document).ready(function() {
    $('.responsive').responsiveText();
  });
</script>
```

Configurations can be added to the markup of each element with simple data attributes:

```html
<h1 class="responsive" data-compression="8" data-min="20" data-max="60">Responsive Text</h1>
```

or 

```html
<p class="responsive" data-compression="25" data-min="14" data-max="40">A jQuery plugin to set font sizes responsively based on its' container width. Use responsiveText.js to have scalable headlines, build <a href="https://github.com/ghepting/jquery-responsive-tables">responsive tables</a> and more!</p>
```

Scrollable Text:

```html
<h1 class="responsive" data-scrollable="1" data-min="20" data-max="60">Scrollable Responsive Text</h1>
```

Complete Options:

```html
<h1 class="responsive" data-compression="8" data-scrollable="1" data-scrollspeed="1000" data-scrollreset="500" data-min="20" data-max="100">Responsive Text with all of the options</h1>
```
