# Generated by Django 4.2.7 on 2023-11-13 04:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='description',
            field=models.CharField(default=1, max_length=200),
            preserve_default=False,
        ),
    ]