<template>
  <div class="card card-table-border-none" id="recent-orders">

    <div class="card-header justify-content-between">
      <h2>Travel Set Table</h2>
      <el-button type="primary" icon="el-icon-circle-plus-outline" @click="handleInsert">新增資料</el-button>
    </div>

    <div class="card-body pt-0 pb-5">
      <div class="row justify-content-between">
        <!--系統推薦選擇-->
        <el-header style="text-align: left; font-size: 12px">
          <el-select v-model="currentUser" value-key="id" placeholder="選擇使用者" @change="handleSelectedUser(currentUser)">
            <el-option label="--請選擇--" disabled :value="null"></el-option>
            <el-option v-for="(item, index) in user"  :label="item" :value="index" :key="item"></el-option>
          </el-select>
        </el-header>


        <!--搜尋框-->
        <div class="search-form d-none d-lg-inline-block col-4">
          <span>當前搜尋: {{currentSearch}}</span>
          <div class="input-group">
            <el-button icon="el-icon-search" v-on:click="handleSearch">資料庫搜尋</el-button>
            <input type="text" name="query" id="search-input" class="form-control"
                   autofocus ="off"
                   v-model="search"
                   placeholder="keywords..."/>
          </div>
        </div>
      </div>


      <!--表格內容-->
      <el-table
          v-loading="loading"
          element-loading-text="唉呦威..."
          element-loading-spinner="el-icon-loading"
          element-loading-background="rgba(0, 0, 0, 0.8)"
          :data="tableData"
          style="width: 100%"
          @sort-change='sortChange'
          height
      >
        <el-table-column
            label="ID"
            prop="sn"
            width="75"
            sortable='custom'
            fixed
            :sort-orders="['descending', 'ascending']">
        </el-table-column>
        <el-table-column
            label="創建者"
            prop="createdUser"
            width="100"
            show-overflow-tooltip
            sortable='custom'
            :sort-orders="['descending', 'ascending']">
        </el-table-column>
        <el-table-column
            label="名稱"
            prop="name"
            width="100"
            show-overflow-tooltip
            sortable='custom'
            :sort-orders="['descending', 'ascending']">
        </el-table-column>
        <el-table-column
            label="描述"
            prop="description"
            width="150"
            show-overflow-tooltip>
        </el-table-column>
        <el-table-column
            label="創建時間"
            prop="createdTime"
            width="250"
            sortable='custom'
            :sort-orders="['descending', 'ascending']">
          <template slot-scope="scope">
            <el-date-picker
                v-model="scope.row.createdTime"
                type="datetime"
                readonly
                align="center">
            </el-date-picker>
          </template>
        </el-table-column>
        <el-table-column
            label="修改時間"
            prop="updateTime"
            width="250"
            sortable='custom'
            :sort-orders="['descending', 'ascending']">
          <template slot-scope="scope">
            <el-date-picker
                v-model="scope.row.updateTime"
                type="datetime"
                readonly
                align="center">
            </el-date-picker>
          </template>
        </el-table-column>
        <el-table-column
            label="推薦優先級"
            width="125"
            prop="priority"
            sortable='custom'
            :sort-orders="['descending', 'ascending']">
        </el-table-column>
        <el-table-column
            label="啟用狀態"
            width="150"
            prop="status"
            sortable='custom'
            :sort-orders="['descending', 'ascending']">
          <template slot-scope="scope">
            <label class="switch switch-text switch-success switch-pill form-control-label">
              <input type="checkbox" class="switch-input form-check-input" v-bind:checked="scope.row.status" v-on:click="handleSwitchStatus(scope.row)">
              <span class="switch-label" data-on="On" data-off="Off"></span>
              <span class="switch-handle"></span>
            </label>
          </template>
        </el-table-column>
        <el-table-column
            width="150"
            align="right"
            fixed="right">
          <template slot-scope="scope">
            <el-button
                size="small"
                type="primary" icon="el-icon-edit"
                @click="handleEdit(scope.$index, scope.row)">Edit
            </el-button>
            <el-button
                size="small"
                type="danger" icon="el-icon-delete"
                @click="handleDelete(scope.$index, scope.row)"></el-button>
          </template>
        </el-table-column>
      </el-table>

      <!--分頁-->
      <div style="margin: 10px;overflow: hidden">
        <div style="float: right;">
          <el-pagination
              background
              :current-page.sync="pageData.currentPage"
              :page-size="pageData.pageSize"
              :total="pageData.totalSize"
              layout="total, prev, pager, next, jumper"
              @current-change="handleSelectPage">
          </el-pagination>
        </div>
      </div>
    </div>

    <el-drawer
        title="Travel Set Detail"
        :before-close="handleCloseTravelSet"
        :visible.sync="this.travelSetDialog"
        v-if="this.travelSetDialog"
        custom-class="demo-drawer"
        ref="drawer"
        size="70%"
        :show-close="false"
        :destroy-on-close="true">

        <travel-set-detail :initTravelSetDetail="currentEditTravelSetDetail"></travel-set-detail>
      <div>
        <el-button type="primary" v-on:click="cancelTravelSetForm">取 消 關 閉</el-button>
        <el-button type="primary" @click="$refs.drawer.closeDrawer()"
                   :loading="travelSetFormLoading">{{ travelSetFormLoading ? '提交中 ...' : '保 存' }}
        </el-button>

      </div>
    </el-drawer>

  </div>
</template>
<script>

module.exports = {
  name: "TravelSetInfo",
  components: {
    "travel-set-detail": httpVueLoader(context + '/assets/a592070/js/components/travelSetDetail02.vue'),
  },
  data() {
    return {
      loading: true,
      travelSetFormLoading: false,
      search: '',
      sortParams: {},
      currentSearch: '',
      currentUser: null,
      user: ["全部", "系統", "一般使用者"],
      pageData: {
        currentPage: null,
        pageSize: null,
        totalSize: null
      },
      tableData: [
        {
          sn: '',
          createdUser: '',
          name: '',
          description: '',
          createdTime: '',
          updateTime: '',
          priority: '',
          status: ''
        }],
      tableColumns: [
        {
          title: 'ID',
          key: 'sn'
        },
        {
          title: 'CreatedUser',
          key: 'createdUser',
        },
        {
          title: 'Name',
          key: 'name'
        },
        {
          title: 'CreatedTime',
          key: 'createdTime'
        },
        {
          title: 'UpdateTime',
          key: 'updateTime'
        },
        {
          title: 'Priority',
          key: 'priority'
        },
        {
          title: 'Status',
          key: 'status'
        },
        {
          title: 'Action',
          key: 'action',
          align: 'center',
          render: (h, params) => {
            return h('div', [
              h('Button', {
                props: {
                  type: 'primary',
                  size: 'small'
                },
                style: {
                  marginRight: '10px'
                },
                on: {
                  click: () => {
                    this.show(params.index)
                  }
                }
              }, 'View'),
              h('Button', {
                props: {
                  type: 'error',
                  size: 'small'
                },
                on: {
                  click: () => {
                    this.remove(params.index)
                  }
                }
              }, 'Delete')
            ]);
          }
        }
      ],
      currentEditTravelSetDetail: {}
    }
  },
  created: function () {
    this.initData();
  },
  computed: {
    // Vuex.mapState(['travelSetDialog'], ['currentEditTravelSetDetail']),
    travelSetDialog(){
      return this.$store.state.travelSetDialog;
    }
  },
  methods: {
    initData() {
      this.loading = true;
      axios.get(context+'/admin/travelSet/list/1')
          .then(response => {
            this.tableData = response.data.tableData;
            this.pageData = response.data.pageData;
          });

      this.loading = false;
    },
    handleSearch() {
      console.log(this.search);
      this.pageData.currentPage = 1;

      this.handleSelectedData();
    },
    handleSelectedUser(user) {
      console.log(user);
      this.currentUser = user;
      this.pageData.currentPage = 1;

      this.handleSelectedData();
    },
    handleSelectPage(value) {
      this.pageData.currentPage = value;

      this.handleSelectedData();
    },
    sortChange: function (column, prop, order) {
      console.log(column + '-' + column.prop + '-' + column.order);
      this.sortParams = {"sortColumn": column.prop, "order": column.order};
      this.handleSelectedData();
    },
    handleSelectedData() {
      this.loading = true;
      let url;

      let user = this.currentUser
      if (!user) {
        user = 0;
      }
      let keyword = this.search;
      if (!this.search || this.search == '') {
        url = context + '/admin/travelSet/list/'+this.pageData.currentPage+'/'+user;
      } else {
        url = context + '/admin/travelSet/list/'+this.pageData.currentPage+'/'+user+'/'+keyword;
      }

      let params = this.sortParams;
      console.log(params);
      axios.get(url, {params})
          .then(response => {
            this.tableData = response.data.tableData;
            this.pageData = response.data.pageData;
            this.currentSearch = this.search;
          });


      this.loading = false;
    },
    handleSwitchStatus(value) {
      console.log(value.status);
      this.loading = true;


      let url = context+'/admin/travelSet/status/'+value.sn;
      axios.post(url)
          .then(response => {
            if(response.data){
              value.status = !value.status;
              const h = this.$createElement;
              this.$message({
                message: h('p', null, [
                  h('i', { style: 'color: teal' }, value.name),
                  h('span', null, '狀態更改成功 ')
                ])
              });
            }else{
              this.$message.error(value.name+': 狀態更改失敗');
            }
          });
      this.loading = false;
    },




    handleInsert() {
      this.$store.commit("toggleTravelSetDialog");
    },
    handleEdit(index, row) {
      console.log(index, row);
      this.currentEditSn = row.sn;
      this.$store.commit("toggleTravelSetDialog");
      axios.get(context+'/admin/travelSet/entity/'+row.sn)
          .then(response => {
            // this.$store.commit("setTravelSetDetail", response.data);
            // this.travelSetDetail = this.$store.state.currentEditTravelSetDetail;
            this.currentEditTravelSetDetail = response.data;
            console.log(this.currentEditTravelSetDetail)
          });
    },
    handleDelete(index, row) {
      console.log(index, row);
      this.$confirm('此操作將永久刪除資料, 是否繼續?', '提示', {
        confirmButtonText: '去死吧',
        cancelButtonText: '手滑了...',
        type: 'warning',
        center: true
      }).then(() => {
        let url = context+'/admin/travelSet/delete/'+row.sn;
        axios.delete(url)
            .then(response => {
              if(response.data == true){
                this.$message({
                  type: 'success',
                  message: '刪除成功!'
                });

                // 更新清單頁面
                this.handleSelectedData();
                // window.location.reload();
              }else{
                this.$message({
                  type: 'info',
                  message: '刪除失敗!!'
                });
              }
            });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消刪除'
        });
      });
    },
    handleCloseTravelSet(done) {
      if (this.travelSetFormLoading) {
        return;
      }
      this.$confirm('確定要提交表單?')
          .then(_ => {
            this.travelSetFormLoading = true;

            let temp = this.$store.getters.getTravelSetDetail.info;
            console.log(temp);
            this.$store.commit("setTravelSetInfo", temp);

            let url = context+"/admin/travelSet/save/"+temp.sn;
            let param = this.$store.getters.getCurrentEditTravelSetDetail;
            axios.post(url, {param})
                .then(response => {
              if(response.data == true){
                this.travelSetFormLoading = false;
                this.$store.commit('toggleTravelSetDialog');

                this.$message({
                  type: 'success',
                  message: '提交成功!'
                });

                // 更新清單頁面
                this.handleSelectedData();
              }else{
                this.$message({
                  type: 'info',
                  message: '提交失敗!!'
                });
              }
            });
          })
          .catch(_ => {
          });
    },
    cancelTravelSetForm() {
      console.log("cancel")
      this.travelSetFormLoading = false;
      // this.travelsetdialog = false;
      this.$store.commit('toggleTravelSetDialog');
      clearTimeout(this.timer);
    }
  }
}
</script>