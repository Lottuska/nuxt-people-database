<template>
        <v-card class="my-4">
            <v-simple-table>
                <template v-slot:default>
                    <thead>
                        <tr>
                            <th class="text-left">
                                ID
                            </th>
                            <th class="text-left">
                                Firstname
                            </th>
                            <th class="text-left">
                                Lastname
                            </th>
                            <th class="text-left">
                                Birthday
                            </th>
                            <th class="text-right">
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="person in people"
                            :key="person.firstname"
                            >
                            <td>{{ person.id }}</td>
                            <td>{{ person.firstname }}</td>
                            <td>{{ person.lastname }}</td>
                            <td>{{ formatBirthday(person.birthday) }}</td>
                            <td>
                                <v-row justify="end">
                                    <PersonDetails :person="person" />
                                    <EditPerson :person="person" />
                                    <DeletePerson :person="person" />
                                </v-row>
                            </td>
                        </tr>
                    </tbody>
                </template>
            </v-simple-table>
        </v-card>
</template>

<script>
import PersonDetails from './PersonDetails.vue'
import EditPerson from './EditPerson.vue'
import DeletePerson from './DeletePerson.vue'
export default {
  name: 'PeopleList',
  components: {
    PersonDetails,
    EditPerson,
    DeletePerson
  },
  data () {
    return {
      people: []
    }
  },
  mounted () {
    this.showPeople()
  },
  methods: {
    showPeople () {
      try {
        this.$axios.get('/api/people')
          .then((response) => {
            this.people = response.data
          })
      } catch (err) {
        console.log(err)
      }
    },
    formatBirthday (bday) {
      const formattedBirthday = bday.split('', 10).join('')
      return formattedBirthday
    },
    deletePerson (id) {
      try {
        this.$axios.post('/api/deleteperson', {
          id
        })
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>
