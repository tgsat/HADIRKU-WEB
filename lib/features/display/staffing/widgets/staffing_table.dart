import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:hadirku_web/utils/utils.dart';

class StaffingTable extends StatelessWidget {
  const StaffingTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColor.lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: (60 * 7) + 40,
        child: DataTable2(
            columnSpacing: 12,
            dataRowHeight: 60,
            headingRowHeight: 40,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn2(
                label: Text("Name"),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('Location'),
              ),
              DataColumn(
                label: Text('Rating'),
              ),
              DataColumn(
                label: Text('Action'),
              ),
            ],
            rows: List<DataRow>.generate(
                15,
                (index) => DataRow(cells: [
                      const DataCell(Text("Santos Enoque")),
                      const DataCell(Text("New yourk city")),
                      const DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.5",
                          )
                        ],
                      )),
                      DataCell(Container(
                          decoration: BoxDecoration(
                            color: AppColor.light,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppColor.active, width: .5),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text("Block",
                              style: TextStyle(
                                color: AppColor.active.withOpacity(.7),
                                fontWeight: FontWeight.bold,
                              )))),
                    ]))),
      ),
    );
  }
}
