<template>
    <div>
        <v-btn
            class="ma-2"
            color="primary"
            @click="dialog = true"
        >
            <v-icon class="mr-2">mdi-plus</v-icon>
            Add a new person
        </v-btn>
        <v-dialog
            v-model="dialog"
            max-width="400px"
        >
            <v-card>
                <v-card-title>Add a new person</v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <v-subheader>Firstname</v-subheader>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-text-field
                                    v-model="firstname"
                                    label="Firstname"
                                    solo
                                    outlined
                                    clearable
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <v-subheader>Lastname</v-subheader>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-text-field
                                    v-model="lastname"
                                    label="Lastname"
                                    solo
                                    outlined
                                    clearable
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <v-subheader>Birthday</v-subheader>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-menu
                                    ref="menu"
                                    v-model="menu"
                                    :close-on-content-click="false"
                                    :return-value.sync="birthday"
                                    transition="scale-transition"
                                    offset-y
                                    min-width="auto"
                                >
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="birthday"
                                            label="Birthday"
                                            v-bind="attrs"
                                            v-on="on"
                                            readonly
                                            solo
                                            outlined
                                            clearable
                                        ></v-text-field>
                                    </template>
                                    <v-date-picker
                                        v-model="birthday"
                                        no-title
                                        scrollable
                                    >
                                        <v-spacer></v-spacer>
                                        <v-btn
                                            text
                                            color="primary"
                                            @click="menu = false"
                                        >
                                            Cancel
                                        </v-btn>
                                        <v-btn
                                            text
                                            color="primary"
                                            @click="$refs.menu.save(birthday)"
                                        >
                                            OK
                                        </v-btn>
                                    </v-date-picker>
                                </v-menu>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                        color="primary"
                        text
                        @click="dialog = false"
                    >
                        Close
                    </v-btn>
                    <v-btn
                        color="primary"
                        @click="addPerson"
                    >
                        Submit
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>
export default {
  name: 'AddNewPerson',
  data () {
    return {
      dialog: false,
      menu: false,
      firstname: '',
      lastname: '',
      birthday: ''
    }
  },
  methods: {
    addPerson () {
      try {
        this.$axios.post('/api/newperson', {
          firstname: this.firstname,
          lastname: this.lastname,
          birthday: this.birthday
        })
          .then(
            this.dialog = false
          )
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>

<style>
</style>
